select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,store_returns sr,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and cd.cd_hash >= 187 and cd.cd_hash <= 937 and d.d_hash >= 48 and d.d_hash <= 381 and c.c_hash >= 235 and c.c_hash <= 635
;
