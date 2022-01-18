select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_demographics cd,store_returns sr
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and d.d_hash >= 38 and d.d_hash <= 438 and c.c_hash >= 143 and c.c_hash <= 476 and cd.cd_hash >= 179 and cd.cd_hash <= 929
;
