select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,store_returns sr,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 127 and d.d_hash <= 460 and c.c_hash >= 78 and c.c_hash <= 828 and cd.cd_hash >= 544 and cd.cd_hash <= 944
;
