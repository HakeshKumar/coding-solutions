SELECT DISTINCT p.*

FROM
    facebook_posts AS p
INNER JOIN
    facebook_reactions AS r
    ON
        p.post_id = r.post_id
        AND r.reaction = 'heart'
