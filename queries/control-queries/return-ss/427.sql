select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,store_returns sr,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 551 and ss.ss_hash <= 884 and c.c_hash >= 237 and c.c_hash <= 987 and cd.cd_hash >= 594 and cd.cd_hash <= 994
;
