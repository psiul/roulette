select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,store_returns sr,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_hash >= 396 and ss.ss_hash <= 729 and c.c_hash >= 166 and c.c_hash <= 566 and d.d_hash >= 243 and d.d_hash <= 993
;
