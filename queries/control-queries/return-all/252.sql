select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,store_returns sr,date_dim d,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and sr.sr_customer_sk = c.c_customer_sk and cd.cd_hash >= 419 and cd.cd_hash <= 819 and d.d_hash >= 532 and d.d_hash <= 865 and c.c_hash >= 2 and c.c_hash <= 752
;
