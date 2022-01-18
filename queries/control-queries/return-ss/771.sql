select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,store_returns sr,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 282 and ss.ss_hash <= 615 and d.d_hash >= 155 and d.d_hash <= 905 and c.c_hash >= 151 and c.c_hash <= 551
;
