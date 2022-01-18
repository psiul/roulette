select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,customer_demographics cd,date_dim d
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 237 and ss.ss_hash <= 570 and c.c_hash >= 148 and c.c_hash <= 898 and d.d_hash >= 57 and d.d_hash <= 457
;
