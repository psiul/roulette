select count(ss.ss_item_sk)
from store_sales ss,date_dim d,store_returns sr,customer_demographics cd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 72 and ss.ss_hash <= 822 and cd.cd_hash >= 467 and cd.cd_hash <= 867 and c.c_hash >= 564 and c.c_hash <= 897
;
