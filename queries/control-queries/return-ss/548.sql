select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,store_returns sr,customer c,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_hash >= 23 and ss.ss_hash <= 356 and cd.cd_hash >= 578 and cd.cd_hash <= 978 and c.c_hash >= 209 and c.c_hash <= 959
;
