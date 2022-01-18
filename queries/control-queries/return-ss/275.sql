select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,date_dim d,customer_demographics cd
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 15 and ss.ss_hash <= 348 and c.c_hash >= 74 and c.c_hash <= 824 and d.d_hash >= 430 and d.d_hash <= 830
;
