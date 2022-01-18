select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_demographics cd,store_returns sr
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 533 and ss.ss_hash <= 933 and c.c_hash >= 6 and c.c_hash <= 756 and cd.cd_hash >= 338 and cd.cd_hash <= 671
;
