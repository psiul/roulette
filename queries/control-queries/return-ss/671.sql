select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,customer c,store_returns sr
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and cd.cd_hash >= 263 and cd.cd_hash <= 663 and d.d_hash >= 99 and d.d_hash <= 849 and c.c_hash >= 164 and c.c_hash <= 497
;
