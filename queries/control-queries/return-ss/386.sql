select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer_demographics cd,date_dim d,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_cdemo_sk = cd.cd_demo_sk and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 4 and ss.ss_hash <= 754 and d.d_hash >= 108 and d.d_hash <= 508 and c.c_hash >= 480 and c.c_hash <= 813
;
