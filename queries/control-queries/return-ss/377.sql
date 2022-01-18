select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,date_dim d,store_returns sr
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 181 and ss.ss_hash <= 931 and c.c_hash >= 537 and c.c_hash <= 870 and cd.cd_hash >= 83 and cd.cd_hash <= 483
;