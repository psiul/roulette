select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_demographics cd,store_returns sr
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 242 and ss.ss_hash <= 642 and d.d_hash >= 189 and d.d_hash <= 939 and cd.cd_hash >= 641 and cd.cd_hash <= 974
;
