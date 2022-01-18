select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,store_returns sr,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 68 and c.c_hash <= 818 and d.d_hash >= 180 and d.d_hash <= 580 and cd.cd_hash >= 270 and cd.cd_hash <= 603
;
