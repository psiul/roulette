select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,date_dim d,customer c,customer_demographics cd
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 156 and ss.ss_hash <= 906 and d.d_hash >= 54 and d.d_hash <= 454 and cd.cd_hash >= 153 and cd.cd_hash <= 486
;
