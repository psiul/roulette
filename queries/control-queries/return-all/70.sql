select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,date_dim d,customer_demographics cd,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 35 and ss.ss_hash <= 785 and d.d_hash >= 532 and d.d_hash <= 932 and cd.cd_hash >= 236 and cd.cd_hash <= 569
;
