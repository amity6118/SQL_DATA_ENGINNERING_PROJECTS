-- Array Intro
select ['python', 'sql','r'] as skills_array;

--  another method 
with skills as(
    select 'python' as skill
    union all
    select'sql'
    union all
    select 'r'
), skills_array as(
    select array_agg(skill order by skill)as skills
    from skills
)
select skills[1]as first_skill
from skills_array

;
-- Array struct
 
 with skill_table as(
    select 'python' as skills, 'programming' as types
    union all 
    select 'sql', 'query_language'
    union all
    select 'r', 'programming'
 ), skills_array_struct as(
    select
        array_agg(struct_pack(
            skill:=skills,
            type:= types
        ))array_struct 
    from skill_table
 )

 select 
    array_struct[1].skill,
    array_struct[2].type,
    array_struct[3]
from skills_array_struct;