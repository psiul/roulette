select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,store_returns sr,date_dim d,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hash >= 221 and ss.ss_hash <= 971 and d.d_hash >= 611 and d.d_hash <= 944 and c.c_hash >= 106 and c.c_hash <= 506
;
