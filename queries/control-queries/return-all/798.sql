select count(ss.ss_item_sk)
from store_sales ss,date_dim d,store_returns sr,customer_demographics cd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hash >= 219 and ss.ss_hash <= 969 and d.d_hash >= 123 and d.d_hash <= 523 and c.c_hash >= 267 and c.c_hash <= 600
;
