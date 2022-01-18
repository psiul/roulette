select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,store_returns sr,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 552 and c.c_hash <= 885 and hd.hd_hash >= 184 and hd.hd_hash <= 934 and cd.cd_hash >= 20 and cd.cd_hash <= 420
;
