select count(ss.ss_item_sk)
from store_sales ss,date_dim d,store_returns sr,customer_demographics cd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_cdemo_sk = cd.cd_demo_sk and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hash >= 63 and ss.ss_hash <= 813 and cd.cd_hash >= 234 and cd.cd_hash <= 634 and c.c_hash >= 249 and c.c_hash <= 582
;
