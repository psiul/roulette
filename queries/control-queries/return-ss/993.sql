select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,store_returns sr,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 12 and cd.cd_hash <= 762 and c.c_hash >= 330 and c.c_hash <= 663 and hd.hd_hash >= 89 and hd.hd_hash <= 489
;
