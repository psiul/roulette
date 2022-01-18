select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,store_returns sr,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 14 and ss.ss_hash <= 764 and i.i_hash >= 1 and i.i_hash <= 334 and cd.cd_hash >= 424 and cd.cd_hash <= 824
;
