select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,date_dim d,customer_demographics cd
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 2 and ss.ss_hash <= 752 and c.c_hash >= 546 and c.c_hash <= 946 and cd.cd_hash >= 661 and cd.cd_hash <= 994
;
