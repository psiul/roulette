select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,store_returns sr,date_dim d,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hash >= 143 and ss.ss_hash <= 543 and cd.cd_hash >= 186 and cd.cd_hash <= 936 and c.c_hash >= 493 and c.c_hash <= 826
;
