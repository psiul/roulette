select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,store_returns sr,date_dim d,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 462 and ss.ss_hash <= 862 and cd.cd_hash >= 217 and cd.cd_hash <= 967 and d.d_hash >= 241 and d.d_hash <= 574
;
