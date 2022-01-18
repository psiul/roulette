select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer_demographics cd,customer c,date_dim d
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_cdemo_sk = cd.cd_demo_sk and sr.sr_customer_sk = c.c_customer_sk and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_hash >= 160 and ss.ss_hash <= 910 and cd.cd_hash >= 420 and cd.cd_hash <= 820 and d.d_hash >= 232 and d.d_hash <= 565
;
