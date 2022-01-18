select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 56 and i.i_hash <= 389 and cd.cd_hash >= 69 and cd.cd_hash <= 819 and hd.hd_hash >= 595 and hd.hd_hash <= 995
;
