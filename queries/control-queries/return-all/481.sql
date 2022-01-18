select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_demographics cd,store_returns sr
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 585 and ss.ss_hash <= 918 and d.d_hash >= 271 and d.d_hash <= 671 and c.c_hash >= 238 and c.c_hash <= 988
;
