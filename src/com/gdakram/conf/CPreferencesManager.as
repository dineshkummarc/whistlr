/**
 * Code found in http://www.adobe.com/cfusion/communityengine/index.cfm?event=showdetails&productId=2&postId=10064
 **/
package com.gdakram.conf
{
    import flash.filesystem.File;
    import flash.filesystem.FileMode;
    import flash.filesystem.FileStream;
    import flash.net.registerClassAlias;
    import flash.utils.Dictionary;
    import flash.utils.Endian;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import flash.utils.IExternalizable;
    
    public class CPreferencesManager
    {
        
        private static const PREFS_FILENAME:String = 'prefs.defaults';
        
        private static var _prefValues:Dictionary;
        
        /**
         * Creates out static instance
         **/
        static public function init():void
        {
            if ( null == _prefValues ) {
                _prefValues = new Dictionary();
                loadPreferences();
            }
            
        }
        
        /**
         * Load the preferences file
         */
        static private function loadPreferences():void {
    
            init();
            
            var fp: File = File.applicationStorageDirectory;
            
            fp = fp.resolvePath( PREFS_FILENAME );
            
            if ( fp.exists ) {
                
                var    _prefsStream:FileStream;
                _prefsStream = new FileStream();
                _prefsStream.open( fp, FileMode.READ);
                _prefsStream.endian = Endian.BIG_ENDIAN;
                
                readExternal( _prefsStream );
                _prefsStream.close();
                
            } else {
                savePreferences();
            }

        }
        
        /**
         * Saves the preferences file
         **/
        static private function savePreferences():void {

            init();

            var fp: File = File.applicationStorageDirectory;
            
            fp = fp.resolvePath( PREFS_FILENAME );
            
            var _prefsStream:FileStream;
            _prefsStream = new FileStream();
            _prefsStream.open( fp, FileMode.WRITE );
            _prefsStream.endian = Endian.BIG_ENDIAN;
            
            writeExternal( _prefsStream );
            _prefsStream.close();
            
        }
        
        /**
         * Sets a preferences value
         **/
        static public function setPreference( name:String, value:Object ):void {
            
            init();

            _prefValues[ name ] = value;
            savePreferences();
            
        }
        
        /**
         * Sets an <int> preferences value
         **/
        static public function setInt( name:String, value:int ):void {
            setPreference( name, value );
        }

        /**
         * Get a preferences values
         **/
        static public function getPreference( name:String ):* {
            
            init();

            var value:Object;
    
            try {
                
                value = _prefValues[ name ];
                
            } catch( e:Error ) {
                
                value = null;
                
            }
            
            return value;
            
        } // getPreference
        
        /**
         * Get an <b>int</b> preferences values
         **/
        static public function getInt( name:String ):int {
            
            var value:* = getPreference( name );
            
            if ( null == value ) {
                return 0;
            } else {
                return value as int;
            }
        }
        
        /**
         * Loads serializes preferences data structure from <b>input:IDataInput</b>.
         **/
        static private function readExternal(input:IDataInput):void
        {
        
            registerClassAlias( "flash.utils.Dictionary", Dictionary );
            _prefValues = input.readObject() as Dictionary;
            
        } // readExternal
    
        /**
         * Writes preferences data as a serialized structure to <b>output:IDataOutput</b>.
         **/
        static private function writeExternal(output:IDataOutput):void
        {

            registerClassAlias( "flash.utils.Dictionary", Dictionary );
            output.writeObject( _prefValues );
            
        } // writeExternal

    } // class


} // package