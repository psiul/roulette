select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,date_dim d,customer_demographics cd,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and sr.sr_customer_sk = c.c_customer_sk and d.d_hash >= 239 and d.d_hash <= 639 and cd.cd_hash >= 146 and cd.cd_hash <= 896 and c.c_hash >= 350 and c.c_hash <= 683
;
