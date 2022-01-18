select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 529 and ss.ss_hash <= 729 and i.i_hash >= 275 and i.i_hash <= 775
;
