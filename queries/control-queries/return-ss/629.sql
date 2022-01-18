select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer_demographics cd,customer c,household_demographics hd
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 319 and cd.cd_hash <= 652 and c.c_hash >= 213 and c.c_hash <= 963 and hd.hd_hash >= 479 and hd.hd_hash <= 879
;
