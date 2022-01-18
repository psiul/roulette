select count(ss.ss_item_sk)
from store_sales ss,customer c,store_returns sr,date_dim d,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 106 and ss.ss_hash <= 856 and c.c_hash >= 452 and c.c_hash <= 785 and cd.cd_hash >= 432 and cd.cd_hash <= 832
;
