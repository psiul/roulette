select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,date_dim d,store_returns sr
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 246 and ss.ss_hash <= 646 and cd.cd_hash >= 229 and cd.cd_hash <= 979 and c.c_hash >= 60 and c.c_hash <= 393
;
