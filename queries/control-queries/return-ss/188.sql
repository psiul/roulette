select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,store_returns sr,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and cd.cd_hash >= 593 and cd.cd_hash <= 993 and c.c_hash >= 190 and c.c_hash <= 940 and d.d_hash >= 169 and d.d_hash <= 502
;
