select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,store_returns sr,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 442 and c.c_hash <= 775 and cd.cd_hash >= 154 and cd.cd_hash <= 904 and hd.hd_hash >= 582 and hd.hd_hash <= 982
;
