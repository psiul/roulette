select count(ss.ss_item_sk)
from store_sales ss,date_dim d,store_returns sr,customer c,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 591 and ss.ss_hash <= 991 and d.d_hash >= 168 and d.d_hash <= 918 and c.c_hash >= 254 and c.c_hash <= 587
;
