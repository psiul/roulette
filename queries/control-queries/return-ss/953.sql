select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,store_returns sr,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hash >= 117 and ss.ss_hash <= 867 and cd.cd_hash >= 151 and cd.cd_hash <= 551 and c.c_hash >= 134 and c.c_hash <= 467
;
