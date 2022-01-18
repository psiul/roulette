select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer_demographics cd,date_dim d,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and cd.cd_hash >= 347 and cd.cd_hash <= 680 and d.d_hash >= 74 and d.d_hash <= 824 and c.c_hash >= 110 and c.c_hash <= 510
;
