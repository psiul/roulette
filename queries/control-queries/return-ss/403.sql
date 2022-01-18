select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,date_dim d,customer_demographics cd
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and sr.sr_returned_date_sk = d.d_date_sk and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 91 and ss.ss_hash <= 424 and d.d_hash >= 112 and d.d_hash <= 862 and cd.cd_hash >= 186 and cd.cd_hash <= 586
;
