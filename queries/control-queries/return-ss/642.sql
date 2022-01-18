select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,date_dim d,customer_demographics cd
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and sr.sr_returned_date_sk = d.d_date_sk and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 479 and ss.ss_hash <= 812 and c.c_hash >= 237 and c.c_hash <= 637 and d.d_hash >= 159 and d.d_hash <= 909
;
