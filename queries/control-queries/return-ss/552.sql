select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,household_demographics hd,customer_demographics cd
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 69 and ss.ss_hash <= 819 and hd.hd_hash >= 438 and hd.hd_hash <= 838 and cd.cd_hash >= 205 and cd.cd_hash <= 538
;
