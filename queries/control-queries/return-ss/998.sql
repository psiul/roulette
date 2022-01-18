select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,customer_demographics cd,date_dim d
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 112 and ss.ss_hash <= 512 and c.c_hash >= 639 and c.c_hash <= 972 and cd.cd_hash >= 67 and cd.cd_hash <= 817
;
