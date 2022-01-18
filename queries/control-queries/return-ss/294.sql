select count(ss.ss_item_sk)
from store_sales ss,item i,store_returns sr,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 158 and ss.ss_hash <= 491 and hd.hd_hash >= 427 and hd.hd_hash <= 827 and cd.cd_hash >= 243 and cd.cd_hash <= 993
;
