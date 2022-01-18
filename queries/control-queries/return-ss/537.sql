select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,date_dim d,customer_demographics cd,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and sr.sr_cdemo_sk = cd.cd_demo_sk and sr.sr_customer_sk = c.c_customer_sk and d.d_hash >= 81 and d.d_hash <= 831 and cd.cd_hash >= 429 and cd.cd_hash <= 762 and c.c_hash >= 124 and c.c_hash <= 524
;
