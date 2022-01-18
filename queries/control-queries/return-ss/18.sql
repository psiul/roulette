select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,store_returns sr,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 220 and ss.ss_hash <= 970 and cd.cd_hash >= 30 and cd.cd_hash <= 430 and c.c_hash >= 173 and c.c_hash <= 506
;
