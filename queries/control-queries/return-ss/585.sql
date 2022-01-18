select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,household_demographics hd,customer_demographics cd
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 209 and ss.ss_hash <= 609 and hd.hd_hash >= 515 and hd.hd_hash <= 848 and cd.cd_hash >= 2 and cd.cd_hash <= 752
;
