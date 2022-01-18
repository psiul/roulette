select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,customer c,store_returns sr
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 1 and ss.ss_hash <= 401 and cd.cd_hash >= 150 and cd.cd_hash <= 900 and c.c_hash >= 138 and c.c_hash <= 471
;
