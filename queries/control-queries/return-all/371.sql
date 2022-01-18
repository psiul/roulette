select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,store_returns sr,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 55 and ss.ss_hash <= 805 and c.c_hash >= 242 and c.c_hash <= 642 and cd.cd_hash >= 481 and cd.cd_hash <= 814
;
