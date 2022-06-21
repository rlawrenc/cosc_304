with data as (
select 'M' as link_type,
       null as parent,
       'All Projects' as id,
       'All Projects' as name,
       null as tooltip,
       null as sub_id,
       null as order_date
  from dual
union
select 'P' as link_type,
       'All Projects' as parent,
       to_char(id) as id,
       name as name,
       description as tooltip,
       id as sub_id,
       (select min(start_date) 
        from demo_proj_tasks t
        where t.project_id = p.id
       ) order_date
  from demo_projects p
union
select 'M' as link_type,
       to_char(project_id) parent,
       to_char(id) id,
       name as name,
       description as tooltip,
       id as sub_id,
       due_date as order_date
  from demo_proj_milestones
union
select 'T' as link_type,
       to_char(project_id) as parent,
       null as id,
       name as name,
       description as tooltip,
       id as sub_id,
       start_date as order_date
  from demo_proj_tasks
  where milestone_id is null
union
select 'T' as link_type,
       to_char(milestone_id) as parent,
       null as id,
       name as name,
       description as tooltip,
       id as sub_id,
       start_date as order_date
  from demo_proj_tasks
  where milestone_id is not null
)
select case when connect_by_isleaf = 1 then 0
            when level = 1             then 1
            else                           -1
       end as status, 
       level, 
       name as title, 
       null as icon, 
       id as value, 
       tooltip as tooltip, 
       case when link_type = 'M'
              then null
            when link_type = 'P'
              then apex_util.prepare_url('f?p='||:APP_ID||':5:'||:APP_SESSION||'::NO::P5_ID:'|| sub_id)
            when link_type = 'M'
              then apex_util.prepare_url('f?p='||:APP_ID||':7:'||:APP_SESSION||'::NO::P7_ID:'|| sub_id)
            when link_type = 'T'
              then apex_util.prepare_url('f?p='||:APP_ID||':9:'||:APP_SESSION||'::NO::P9_ID:'|| sub_id)
            else null
        end as link 
from data
start with parent is null
connect by prior id = parent
order siblings by order_date